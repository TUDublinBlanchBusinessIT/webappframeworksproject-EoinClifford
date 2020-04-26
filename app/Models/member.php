<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model as Model;

/**
 * Class member
 * @package App\Models
 * @version April 20, 2020, 2:01 pm UTC
 *
 * @property \Illuminate\Database\Eloquent\Collection bookings
 * @property string firstname
 * @property string surname
 * @property string membertype
 * @property string dateofbirth
 */
class member extends Model
{

    public $table = 'member';
    
    const CREATED_AT = 'created_at';
    const UPDATED_AT = 'updated_at';




    public $fillable = [
        'firstname',
        'surname',
        'membertype',
        'dateofbirth'
    ];

    /**
     * The attributes that should be casted to native types.
     *
     * @var array
     */
    protected $casts = [
        'id' => 'integer',
        'firstname' => 'string',
        'surname' => 'string',
        'membertype' => 'string',
        'dateofbirth' => 'date'
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
        return $this->hasMany(\App\Models\Booking::class, 'memberid');
    }
}
