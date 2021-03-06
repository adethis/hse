<?php

if (!function_exists('base_url')) {
	function base_url($atRoot=FALSE, $atCore=FALSE, $parse=FALSE){
		if (isset($_SERVER['HTTP_HOST'])) {
			$http = isset($_SERVER['HTTPS']) && strtolower($_SERVER['HTTPS']) !== 'off' ? 'https' : 'http';
			$hostname = $_SERVER['HTTP_HOST'];
			$dir = str_replace(basename($_SERVER['SCRIPT_NAME']), '', $_SERVER['SCRIPT_NAME']);
			$core = preg_split('@/@', str_replace($_SERVER['DOCUMENT_ROOT'], '', realpath(dirname(__FILE__))), NULL, PREG_SPLIT_NO_EMPTY);
			$core = $core[0];
			$tmplt = $atRoot ? ($atCore ? "%s://%s/%s/" : "%s://%s/") : ($atCore ? "%s://%s/%s/" : "%s://%s%s");
			$end = $atRoot ? ($atCore ? $core : $hostname) : ($atCore ? $core : $dir);
			$base_url = sprintf( $tmplt, $http, $hostname, $end );
		}
		else $base_url = 'http://localhost/';
		if ($parse) {
			$base_url = parse_url($base_url);
			if (isset($base_url['path'])) if ($base_url['path'] == '/') $base_url['path'] = '';
		}
		return $base_url;
	}
}

if (!function_exists('segment_url')) {
	function segment_uri($number = NULL) {
		if (isset($number)) {
			$u = explode("/", $_SERVER['REQUEST_URI']);
			$url = $u[$number + 1];
		} else {
			$url = $_SERVER['REQUEST_URI'];
		}

		return $url;
	}
}

if (!function_exists('get_hari')) {
	function get_hari($d = NULL) {
		if (isset($d)) {
			$hari = ['Minggu', 'Senin', 'Selasa', 'Rabu', 'Kamis', 'Jumat', 'Sabtu'];
			foreach ($hari as $key => $value) {
				if ($key == $d) {
					return $value;
				}
			}
		}
	}
}