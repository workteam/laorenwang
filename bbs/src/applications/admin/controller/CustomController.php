<?php
Wind::import('ADMIN:library.AdminBaseController');
/**
 * 常用菜单定制
 *
 * @author Shi Long <long.shi@alibaba-inc.com>
 * @copyright ©2003-2103 phpwind.com
 * @license http://www.windframework.com
 * @version $Id: CustomController.php 21801 2012-12-13 09:31:09Z yishuo $
 * @package admin.controller
 */
class CustomController extends AdminBaseController {
	
	/* (non-PHPdoc)
	 * @see WindController::run()
	 */
	public function run() {
		$menuService = Wekit::load('ADMIN:service.srv.AdminMenuService');
		$userService = Wekit::load('ADMIN:service.srv.AdminUserService');
		$myMenus = $userService->getAuths($this->adminUser);
		$menuTables = $menuService->getMenuTable();
		if ($myMenus !== '-1') {
			foreach ($menuTables as $key => $value)
				if (isset($value['url']) && !in_array($key, (array) $myMenus)) unset(
					$menuTables[$key]);
		}
		$menus = AdminMenuHelper::resetMenuStruts($menuTables);
		foreach ($menus as $key => $value) {
			if (isset($value['items']) && empty($value['items'])) {
				unset($menus[$key]);
			}
		}
		$this->setOutput($menus, 'menus');
		$myMenu = $this->_loadCustomDs()->findByUsername($this->adminUser->getUsername());
		$this->setOutput($myMenu ? explode(',', $myMenu['custom']) : array(), 'myMenu');
	}
	
	/**
	 * 保存设置
	 *
	 */
	public function doRunAction() {
		$customs = $this->getInput('customs', 'post');
		$customs || $customs = array();
		if (count($customs) > 15) $this->showError('ADMIN:custom.size');
		$this->_loadCustomDs()->replace($this->adminUser->getUsername(), implode(',', $customs));
		$this->showMessage('success');
	}
	
	/**
	 * @return AdminCustom
	 */
	private function _loadCustomDs() {
		return Wekit::load('APPS:admin.service.AdminCustom');
	}
}

?>