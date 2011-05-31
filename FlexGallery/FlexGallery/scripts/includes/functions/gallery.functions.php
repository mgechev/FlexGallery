<?php

function uploadAndResizeImage($source, $target, $maxWidthSizePx, $maxHeightSizePx)
{
	@ini_set('memory_limit', '100M');
	
	list($width, $height) = getimagesize($source);

	$modwidth = 0;
	$modheight = 0;

	if ($width <= $maxWidthSizePx && $height <= $maxHeightSizePx) {
		return copy($source, $target);
	} else if ($width > $maxWidthSizePx && $height < $maxHeightSizePx) {
			$modwidth = $maxWidthSizePx;
			$diff = $width / $modwidth;
			$modheight = $height / $diff;
			if ($modheight > $maxHeightSizePx) {
				$mod2height = $modheight;
				$modheight = $maxHeightSizePx;
				$diff = $mod2height / $modheight;
				$modwidth = $modheight / $diff;
			}
		} else {
			$modheight = $maxHeightSizePx;
			$diff = $height / $modheight;
			$modwidth = $width / $diff;
			if ($modwidth > $maxWidthSizePx) {
				$mod2width = $modwidth;
				$modwidth = $maxWidthSizePx;
				$diff = $mod2width / $modwidth;
				$modheight = $modheight / $diff;
			}
		}

	if ($modwidth > 0 && $modheight > 0) {
		$tn = imagecreatetruecolor($modwidth, $modheight);
		$imageInfo = getimagesize($source);
		if (($imageInfo['mime'] == 'image/jpeg') || ($imageInfo['mime'] == 'image/pjpeg')) {
			$file = imagecreatefromjpeg($source) ;
			imagecopyresampled($tn, $file, 0, 0, 0, 0, $modwidth, $modheight, $width, $height) ;
			return imagejpeg($tn, $target, 100) ;
		} elseif ($imageInfo['mime'] == 'image/gif') {
			$file = imagecreatefromgif($source) ;
			imagecopyresampled($tn, $file, 0, 0, 0, 0, $modwidth, $modheight, $width, $height) ;
			return imagegif($tn, $target) ;
		} elseif ($imageInfo['mime'] == 'image/png') {
			$file = imagecreatefrompng($source) ;
			imagecopyresampled($tn, $file, 0, 0, 0, 0, $modwidth, $modheight, $width, $height) ;
			return imagepng($tn, $target) ;			
		}
	}
}

?>