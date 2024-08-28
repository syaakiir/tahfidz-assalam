<?php

namespace App\Http\Resources\Assessment;

use App\Model\AssessmentLog\AssessmentLog;

use App\Http\Resources\Assessment\AssessmentResource;
use Illuminate\Http\Resources\Json\ResourceCollection;

class AssessmentCollection extends ResourceCollection
{
    /**
     * Transform the resource collection into an array.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return array
     */
    public function toArray($request)
    {
        $this->collection->transform(function (AssessmentLog $assessment) {
            return new AssessmentResource($assessment);
        });

        return parent::toArray($request);
    }
}