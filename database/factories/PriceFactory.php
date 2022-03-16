<?php

namespace Database\Factories;

use App\Models\Price;
use Illuminate\Database\Eloquent\Factories\Factory;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\Price>
 */
class PriceFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */
	public function definition()
    {
        return [
            'item' => 'BTC',
			'price' => $this->faker->randomFloat(2, 4000, 5000),
			'created_at' => $this->faker->dateTimeBetween('-1 week', '+1 week'),
        ];
    }
}
