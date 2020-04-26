@extends('layouts.app')

@section('content')
    <section class="content-header">
        <h1>
            Pitch
        </h1>
   </section>
   <div class="content">
       @include('adminlte-templates::common.errors')
       <div class="box box-primary">
           <div class="box-body">
               <div class="row">
                   {!! Form::model($pitch, ['route' => ['pitches.update', $pitch->id], 'method' => 'patch']) !!}

                        @include('pitches.fields')

                   {!! Form::close() !!}
               </div>
           </div>
       </div>
   </div>
@endsection