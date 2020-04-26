<?php

namespace App\Repositories;

use App\Models\pitch;
use App\Repositories\BaseRepository;

/**
 * Class pitchRepository
 * @package App\Repositories
 * @version April 26, 2020, 1:22 pm UTC
*/

class pitchRepository extends BaseRepository
{
    /**
     * @var array
     */
    protected $fieldSearchable = [
        'surface',
        'floodlights',
        'indoor'
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
        return pitch::class;
    }
}
