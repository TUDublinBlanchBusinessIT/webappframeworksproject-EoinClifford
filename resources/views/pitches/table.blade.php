<div class="table-responsive">
    <table class="table" id="pitches-table">
        <thead>
            <tr>
                <th>Surface</th>
        <th>Floodlights</th>
        <th>Indoor</th>
                <th colspan="3">Action</th>
            </tr>
        </thead>
        <tbody>
        @foreach($pitches as $pitch)
            <tr>
                <td>{{ $pitch->surface }}</td>
            <td>{{ $pitch->floodlights }}</td>
            <td>{{ $pitch->indoor }}</td>
                <td>
                    {!! Form::open(['route' => ['pitches.destroy', $pitch->id], 'method' => 'delete']) !!}
                    <div class='btn-group'>
                        <a href="{{ route('pitches.show', [$pitch->id]) }}" class='btn btn-default btn-xs'><i class="glyphicon glyphicon-eye-open"></i></a>
                        <a href="{{ route('pitches.edit', [$pitch->id]) }}" class='btn btn-default btn-xs'><i class="glyphicon glyphicon-edit"></i></a>
                        {!! Form::button('<i class="glyphicon glyphicon-trash"></i>', ['type' => 'submit', 'class' => 'btn btn-danger btn-xs', 'onclick' => "return confirm('Are you sure?')"]) !!}
                    </div>
                    {!! Form::close() !!}
                </td>
            </tr>
        @endforeach
        </tbody>
    </table>
</div>
