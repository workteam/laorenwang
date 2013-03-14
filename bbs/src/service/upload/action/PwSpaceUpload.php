<?php
defined('WEKIT_VERSION') || exit('Forbidden');

Wind::import('SRV:upload.action.PwUploadAction');
Wind::import('COM:utility.WindUtility');

/**
 * the last known user to change this file in the repository  <$LastChangedBy: gao.wanggao $>
 * @author $Author: gao.wanggao $ Foxsee@aliyun.com
 * @copyright ©2003-2103 phpwind.com
 * @license http://www.phpwind.com
 * @version $Id: PwSpaceUpload.php 22614 2012-12-26 01:50:03Z gao.wanggao $ 
 * @package 
 */

class PwSpaceUpload extends PwUploadAction {
	public $dir;
	public $filename;
	protected $uid = 0;
	
	public function __construct($uid) {
		$this->ftype = array('jpeg'=>2000, 'jpg' => 2000, 'png' => '2000', 'gif' => 2000);
		$this->uid = $uid;
	}
	
	/**
	 * @see PwUploadAction.check
	 */
	public function check() {
		
		return true;
	}
	
	/**
	 * @see PwUploadAction.allowType
	 */
	public function allowType($key) {
		return true;
	}
	
	/**
	 * @see PwUploadAction.getSaveName
	 */
	public function getSaveName(PwUploadFile $file) {
		//$prename  = substr(md5(Pw::getTime() . WindUtility::generateRandStr(8)), 10, 15);
		$this->filename = Pw::getTime() . '.' .$file->ext;
		return $this->filename;
	}
	
	/**
	 * @see PwUploadAction.getSaveDir
	 */
	public function getSaveDir(PwUploadFile $file) {
		//list($y, $m, $d) = explode('-', date('Y-m-d', Pw::getTime()));
		$this->dir = 'space/' . $this->uid . '/';
		return  $this->dir;
	}
	
	/**
	 * @see PwUploadAction.allowThumb
	 */
	public function allowThumb() {
		return false;
	}
	
	/**
	 * @see PwUploadAction.getThumbInfo
	 */
	public function getThumbInfo($filename, $dir) {
		return array(
			array()
		);
	}
	
	/**
	 * @see PwUploadAction.allowWaterMark
	 */
	public function allowWaterMark() {
		return false;
	}
	
	public function transfer() {
		return true;
	}

	/**
	 * @see PwUploadAction.update
	 */
	public function update($uploaddb) {
		foreach ($uploaddb as $key => $value) {
			$this->attachs = array(
				'name'      => $value['name'],
				'type'      => $value['type'],
				'path'		=> $this->dir . $this->filename,
				'size'      => $value['size'],
				'width'		=> $this->width,
				'height'	=> $this->height
			);
		}
		return true;
	}

	public function getAids() {
		return array_keys($this->attachs);
	}

	public function getAttachInfo() {
		return $this->attachs;
	}
}
?>