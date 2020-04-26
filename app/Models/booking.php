<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model as Model;

/**
 * Class booking
 * @package App\Models
 * @version April 26, 2020, 1:23 pm UTC
 *
 * @property \App\Models\Member memberid
 * @property \App\Models\Pitch pitchid
 * @property string bookingdate
 * @property time starttime
 * @property time endtime
 * @property integer memberid
 * @property integer pitchid
 * @property number fee
 */
class booking extends Model
{

    public $table = 'booking';
    
    const CREATED_AT = 'created_at';
    const UPDATED_AT = 'updated_at';




    public $fillable = [
        'bookingdate',
        'starttime',
        'endtime',
        'memberid',
        'pitchid',
        'fee'
    ];

    /**
     * The attributes that should be casted to native types.
     *
     * @var array
     */
    protected $casts = [
        'id' => 'integer',
        'bookingdate' => 'date',
        'memberid' => 'integer',
        'pitchid' => 'integer',
        'fee' => 'float'
    ];

    /**
     * Validation rules
     *
     * @var array
     */
    public static $rules = [
        
    ];

    /**
     * @return \Illuminate\Database\Eloquent\Relations\BelongsTo
     **/
    public function memberid()
    {
        return $this->belongsTo(\App\Models\Member::class, 'memberid');
    }

    /**
     * @return \Illuminate\Database\Eloquent\Relations\BelongsTo
     **/
    public function pitchid()
    {
        return $this->belongsTo(\App\Models\Pitch::class, 'pitchid');
    }
}
