<?php

namespace App\Http\Controllers;

use App\Http\Requests\CreatepitchRequest;
use App\Http\Requests\UpdatepitchRequest;
use App\Repositories\pitchRepository;
use App\Http\Controllers\AppBaseController;
use Illuminate\Http\Request;
use Flash;
use Response;

class pitchController extends AppBaseController
{
    /** @var  pitchRepository */
    private $pitchRepository;

    public function __construct(pitchRepository $pitchRepo)
    {
        $this->pitchRepository = $pitchRepo;
    }

    /**
     * Display a listing of the pitch.
     *
     * @param Request $request
     *
     * @return Response
     */
    public function index(Request $request)
    {
        $pitches = $this->pitchRepository->all();

        return view('pitches.index')
            ->with('pitches', $pitches);
    }

    /**
     * Show the form for creating a new pitch.
     *
     * @return Response
     */
    public function create()
    {
        return view('pitches.create');
    }

    /**
     * Store a newly created pitch in storage.
     *
     * @param CreatepitchRequest $request
     *
     * @return Response
     */
    public function store(CreatepitchRequest $request)
    {
        $input = $request->all();

        $pitch = $this->pitchRepository->create($input);

        Flash::success('Pitch saved successfully.');

        return redirect(route('pitches.index'));
    }

    /**
     * Display the specified pitch.
     *
     * @param int $id
     *
     * @return Response
     */
    public function show($id)
    {
        $pitch = $this->pitchRepository->find($id);

        if (empty($pitch)) {
            Flash::error('Pitch not found');

            return redirect(route('pitches.index'));
        }

        return view('pitches.show')->with('pitch', $pitch);
    }

    /**
     * Show the form for editing the specified pitch.
     *
     * @param int $id
     *
     * @return Response
     */
    public function edit($id)
    {
        $pitch = $this->pitchRepository->find($id);

        if (empty($pitch)) {
            Flash::error('Pitch not found');

            return redirect(route('pitches.index'));
        }

        return view('pitches.edit')->with('pitch', $pitch);
    }

    /**
     * Update the specified pitch in storage.
     *
     * @param int $id
     * @param UpdatepitchRequest $request
     *
     * @return Response
     */
    public function update($id, UpdatepitchRequest $request)
    {
        $pitch = $this->pitchRepository->find($id);

        if (empty($pitch)) {
            Flash::error('Pitch not found');

            return redirect(route('pitches.index'));
        }

        $pitch = $this->pitchRepository->update($request->all(), $id);

        Flash::success('Pitch updated successfully.');

        return redirect(route('pitches.index'));
    }

    /**
     * Remove the specified pitch from storage.
     *
     * @param int $id
     *
     * @throws \Exception
     *
     * @return Response
     */
    public function destroy($id)
    {
        $pitch = $this->pitchRepository->find($id);

        if (empty($pitch)) {
            Flash::error('Pitch not found');

            return redirect(route('pitches.index'));
        }

        $this->pitchRepository->delete($id);

        Flash::success('Pitch deleted successfully.');

        return redirect(route('pitches.index'));
    }
}
