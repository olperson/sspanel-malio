<?php

namespace App\Services\Gateway;

use App\Services\View;
use App\Services\Auth;
use App\Services\Config;
use App\Models\Paylist;

class EpUsdt extends AbstractPayment
{
	
	
	public function __construct($appSecret)
	{
		$this->appSecret = $appSecret;
		$this->gatewayUri = Config::get('epusdt_url');
	}
	
	
	public function sign($parameter, string $signKey)
	{
		ksort($parameter);
		reset($parameter); //内部指针指向数组中的第一个元素
		$sign = '';
		$urls = '';
		foreach ($parameter as $key => $val) {
			if ($val == '') continue;
			if ($key != 'signature') {
				if ($sign != '') {
					$sign .= "&";
					$urls .= "&";
				}
				$sign .= "$key=$val"; //拼接为url参数形式
				$urls .= "$key=" . urlencode($val); //拼接为url参数形式
			}
		}
		$sign = md5($sign . $signKey);//密码追加进入开始MD5签名
//		file_put_contents(BASE_PATH . '/storage/epusdt.log',$sign."\r\n" , FILE_APPEND);
		return $sign;
	}
	
	
	public function Maliopay($type, $price)
	{
		$user = Auth::getUser();
		$pl = new Paylist();
		$pl->userid = $user->id;
		$pl->total = $price;
		$pl->datetime = time();
		$pl->tradeno = self::generateGuid();
		$pl->save();
		$amount = (float)$pl->total;//从URL参数中的n=*获取amount数据
		$notify_url = 'https://' . $_SERVER['HTTP_HOST'] . '/payment/notify/epusdt';//Epusdt的异步回调地址
		$redirect_url = 'https://' . $_SERVER['HTTP_HOST'] . '/user/payment/return?tradeno=' . $pl->tradeno;
		$order_id = $pl->tradeno;
		$key = Config::get('epusdt_token');//Epusdt的自定义密钥
		//用MD5算法计算签名
		$parameter=array(
			'order_id' => $order_id,//生成数据包，用到了的数组转json的jsonencode
			'amount' => $amount,
			'notify_url' => $notify_url,
			'redirect_url' => $redirect_url);
		$signature = $this->sign($parameter, $key);//用MD5算法计算签名
		$data = json_encode(array(
			'order_id' => $order_id,//生成数据包，用到了的数组转json的jsonencode
			'amount' => $amount,
			'notify_url' => $notify_url,
			'redirect_url' => $redirect_url,
			'signature' => $signature));
		$res = $this->post(Config::get('epusdt_url').'/api/v1/order/create-transaction', $data, 'post');
		$arr = json_decode($res, true);//对返回数据进行json到数组的转换，用到了jsondecode
		$resdata=$arr['data'];//提取返回数据的数组中的data段落
		$payurl= $resdata['payment_url'];//提取返回数据的数组中的data段落中的支付链接
		return ['url' =>$payurl, 'errcode' => 0, 'pid' => $pl->tradeno];
	}
	
	public function post($url, $data = null, $method = 'post', $header = array("content-type: application/json"), $https = true, $timeout = 5)
	{
		$method = strtoupper($method);
		$ch = curl_init();//初始化
		curl_setopt($ch, CURLOPT_URL, $url);//访问的URL
		curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);//只获取页面内容，但不输出
		if ($https) {
			curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);//https请求 不验证证书
			curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, false);//https请求 不验证HOST
		}
		if ($method != "GET") {
			if ($method == 'POST') {
				curl_setopt($ch, CURLOPT_POST, true);//请求方式为post请求
			}
			if ($method == 'PUT' || strtoupper($method) == 'DELETE') {
				curl_setopt($ch, CURLOPT_CUSTOMREQUEST, $method); //设置请求方式
			}
			curl_setopt($ch, CURLOPT_POSTFIELDS, $data);//请求数据
		}
		curl_setopt($ch, CURLOPT_TIMEOUT, $timeout);
		curl_setopt($ch, CURLOPT_HTTPHEADER, $header); //模拟的header头
		//curl_setopt($ch, CURLOPT_HEADER, false);//设置不需要头信息
		$result = curl_exec($ch);//执行请求
		curl_close($ch);//关闭curl，释放资源
		return $result;
	}
	
	public function purchase($request, $response, $args)
	{
		$price = $request->getParam('amount');
		if ($price <= 0) {
			return json_encode(['code' => -1, 'msg' => '非法的金额.']);
		}
		$user = Auth::getUser();
		$pl = new Paylist();
		$pl->userid = $user->id;
		$pl->total = $price;
		$pl->tradeno = self::generateGuid();
		$pl->save();
		$data['app_id'] = Config::get('paytaro_app_id');
		$data['out_trade_no'] = $pl->tradeno;
		$data['total_amount'] = (int)$price * 100;
		$data['notify_url'] = Config::get('baseUrl') . '/payment/notify';
		$data['return_url'] = Config::get('baseUrl') . '/user/payment/return';
		$params = $this->prepareSign($data);
		$data['sign'] = $this->sign($params);
		$result = json_decode($this->post($data), true);
		if (!isset($result['data'])) {
			return json_encode(['code' => -1, 'msg' => '支付网关处理失败']);
		}
		$result['pid'] = $pl->tradeno;
		return json_encode(['url' => $result['data']['pay_url'], 'code' => 0, 'pid' => $pl->tradeno]);
	}
	
	
	public function notify($request, $response, $args)
	{
		//file_put_contents(BASE_PATH . '/storage/paytaro.log', json_encode($request->getParams())."\r\n", FILE_APPEND);
		$data = $request->getParams();
		$signature = $this->sign($data, Config::get('epusdt_token'));
		if ($data['signature'] != $signature) { //不合法的数据
			return 'fail';  //返回失败 继续补单
		} else {
			//合法的数据
			//业务处理
			$this->postPayment($request->getParam('order_id'), 'epusdt');
		return 'ok';
		}
	}
	
	public function getPurchaseHTML()
	{
		return View::getSmarty()->fetch('user/paytaro.tpl');
	}
	
	public function getReturnHTML($request, $response, $args)
	{
		header('Location:/user/code');
	}
	
	public function getStatus($request, $response, $args)
	{
		$return = [];
		$p = Paylist::where('tradeno', $_POST['pid'])->first();
		$return['ret'] = 1;
		$return['result'] = $p->status;
		return json_encode($return);
	}
}
