<?php

/**
 * 清空用户数据
 *
 * @author xiaoxia.xu <xiaoxia.xuxx@aliyun-inc.com>
 * @copyright ©2003-2103 phpwind.com
 * @license http://www.windframework.com
 * @version $Id: PwClearUserService.php 20650 2012-11-01 09:10:44Z xiaoxia.xuxx $
 * @package src.service.user.srv
 */
class PwClearUserService extends PwBaseHookService {
	
	private $uid = 0;
	private $operator = null;

	/**
	 * 清理用户信息
	 */
	public function __construct($uid = 0, PwUserBo $operator = null) {
		$this->uid = intval($uid);
		$operator && $this->operator = $operator;
	}

	/**
	 * 执行
	 *
	 * @param array $clearType 具体清理的项目
	 * @param PwUserBo $operator
	 * @return boolean
	 */
	public function run($clearType) {
		if (0 >= $this->uid || empty($clearType)) return false;
		$num = $this->init($clearType);
		if ($num == 0) return false;
		$this->runDo('gleanData', $this->operator);
		$this->runDo('run', $this->uid);
		//当清理用户全部信息的时候，将会清除用户的资料
		if (count($this->getClearTypes()) == $num) {
			$result = $this->_getUserDs()->deleteUser($this->uid);
			Wekit::load('user.srv.PwUserService')->restoreDefualtAvatar($this->uid);
		}
		return true;
	}

	/**
	 * 返回支持的用户清理清理项目,可对类型进行扩展
	 * 
	 * @return array
	 */
	public function getClearTypes() {
		//【用户清理】扩展-添加到hooks.PwClearUser下
		return array(
			'topic' => array('title' => '主题', 'class' => 'SRC:hooks.PwClearUser.PwClearDoTopic'),  //主题
			'post' => array('title' => '回复', 'class' => 'SRC:hooks.PwClearUser.PwClearDoPost'),  //回复
			'message' => array('title' => '消息', 'class' => 'SRC:hooks.PwClearUser.PwClearDoMessage'),  //消息
			'fresh' => array('title' => '新鲜事', 'class' => 'SRC:hooks.PwClearUser.PwClearDoFresh')//新鲜事
		);
	}
	
	/* (non-PHPdoc)
	 * @see PwBaseHookService::_getInterfaceName()
	 */
	protected function _getInterfaceName() {
		return 'iPwGleanDoHookProcess';
	}
	
	/**
	 * 初始化
	 */
	private function init($clearType) {
		$types = $this->getClearTypes();
		$num = 0;
		foreach ($clearType as $item) {
			$_type = isset($types[$item]) ? $types[$item] : array();
			if (!$_type || !$_type['class']) continue;
			/* @var $instance iPwDoHookProcess */
			$this->appendDo(Wekit::getInstance($_type['class'], 'load'));
			$num++;
		}
		return $num;
	}
	
	/** 
	 * 获得用户Ds
	 *
	 * @return PwUser
	 */
	private function _getUserDs() {
		return Wekit::load('user.PwUser');
	}
}