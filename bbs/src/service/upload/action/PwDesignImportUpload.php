<?php
defined('WEKIT_VERSION') || exit('Forbidden');

Wind::import('SRV:upload.action.PwUploadAction');
Wind::import('COM:utility.WindUtility');

/**
 * the last known user to change this file in the repository  <$LastChangedBy: gao.wanggao $>
 * @author $Author: gao.wanggao $ Foxsee@aliyun.com
 * @copyright ©2003-2103 phpwind.com
 * @license http://www.phpwind.com
 * @version $Id: PwDesignImportUpload.php 21973 2012-12-17 12:17:13Z gao.wanggao $ 
 * @package 
 */

class PwDesignImportUpload extends PwUploadAction {

	public function __construct() {
		$this->ftype = array('zip' => 2000, 'txt' => 2000);
		$this->isLocal = true;
	}
	
	/**
	 * @see PwUploadAction.check
	 */
	public function check() {
		if (!$_FILES) return new PwError('file.empty.fail');
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
		$prename  = substr(md5(Pw::getTime() . WindUtility::generateRandStr(8)), 10, 15);
		$this->filename = $prename . '.' .$file->ext;
		return $this->filename;
	}
	
	/**
	 * @see PwUploadAction.getSaveDir
	 */
	public function getSaveDir(PwUploadFile $file) {
		return  $this->dir = 'tmp/';
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
		return array();
	}
	
	/**
	 * @see PwUploadAction.allowWaterMark
	 */
	public function allowWaterMark() {
		return false;
	}
	
	public function transfer() {
		return false;
	}

	/**
	 * @see PwUploadAction.update
	 */
	public function update($uploaddb) {
		foreach ($uploaddb as $key => $value) {
			$this->attachs = array(
				'name'      => $value['name'],
				'type'      => $value['type'],
				'path'		=> $this->dir,
				'filename'	=> $this->filename,
				'size'      => $value['size'],
				'ext'		=> $value['ext'],
			);
		}
		return true;
	}

	public function getAttachInfo() {
		return $this->attachs;
	}
}
?>