<?php

namespace App\Repositories;

use App\Models\booking;
use App\Repositories\BaseRepository;

/**
 * Class bookingRepository
 * @package App\Repositories
 * @version April 26, 2020, 1:23 pm UTC
*/

class bookingRepository extends BaseRepository
{
    /**
     * @var array
     */
    protected $fieldSearchable = [
        'bookingdate',
        'starttime',
        'endtime',
        'memberid',
        'pitchid',
        'fee'
    ];

    /**
     * Return searchable fields
     *
     * @return array
     */
    public function getFieldsSearchable()
    {
        return $this->fieldSearchable;
    }

    /**
     * Configure the Model
     **/
    public function model()
    {
        return booking::class;
    }
}
