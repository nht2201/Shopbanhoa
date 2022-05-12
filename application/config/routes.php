<?php
defined('BASEPATH') OR exit('No direct script access allowed');
$route['dang-nhap'] = 'user/login';
$route['dang-ky'] = 'user/register';
$route['ban-chay'] = 'product/hot';
$route['moi'] = 'product/news';
$route['khuyen-mai'] = 'product/discount';
$route['(:any)-c(:num)'] = 'product/catalog/$2';
$route['(:any)-p(:num)'] = 'product/view/$2';
$route['default_controller'] = 'home';
$route['404_override'] = '';
$route['translate_uri_dashes'] = FALSE;
