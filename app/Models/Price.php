<?php

namespace App\Models;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Price extends Model
{
    use HasFactory;
	
	public function getPrice(){
		$today=Carbon::parse(Carbon::now())->toDateString();
		$todayPriceArray=$this->whereDate('created_at', $today)->first();
		$todayPrice=$todayPriceArray['price'];
		
		$lastDay=Carbon::parse(Carbon::now()->subDays(30))->toDateString();
		
		$lastDayPriceArray=$this->whereBetween('created_at', [$lastDay, $today])->get();
		$minPrice=0.0;
		$maxPrice=0.0;
		foreach($lastDayPriceArray as $lastDayPrice){
			if($minPrice>=$lastDayPrice['price'] || $minPrice==0.0){
				$minPrice=$lastDayPrice['price'];
			}
			if($maxPrice<=$lastDayPrice['price']){
				$maxPrice=$lastDayPrice['price'];
			}
		}
		$price=array();
		$price['today_price']=$todayPrice;
		$price['min_price']=$minPrice;
		$price['max_price']=$maxPrice;
		return $price;
	}
}
