<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model as Model;

/**
 * Class pitch
 * @package App\Models
 * @version April 26, 2020, 1:22 pm UTC
 *
 * @property \Illuminate\Database\Eloquent\Collection bookings
 * @property string surface
 * @property boolean floodlights
 * @property boolean indoor
 */
class pitch extends Model
{

    public $table = 'pitch';
    
    const CREATED_AT = 'created_at';
    const UPDATED_AT = 'updated_at';




    public $fillable = [
        'surface',
        'floodlights',
        'indoor'
    ];

    /**
     * The attributes that should be casted to native types.
     *
     * @var array
     */
    protected $casts = [
        'id' => 'integer',
        'surface' => 'string',
        'floodlights' => 'boolean',
        'indoor' => 'boolean'
    ];

    /**
     * Validation rules
     *
     * @var array
     */
    public static $rules = [
        
    ];

    /**
     * @return \Illuminate\Database\Eloquent\Relations\HasMany
     **/
    public function bookings()
    {
        return $this->hasMany(\App\Models\Booking::class, 'pitchid');
    }
}
