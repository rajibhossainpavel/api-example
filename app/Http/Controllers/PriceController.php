<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use \App\Models\Price;
use App\Http\Resources\PriceResource;

class PriceController extends Controller
{
	
	public function __construct(){
		
	}
    public static function getPrice(){
		$Price=new Price;
		return new PriceResource($Price->getPrice());
	}
}
