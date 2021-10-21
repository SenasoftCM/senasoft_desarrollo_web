<x-app-layout>
    <x-slot name="header">
        <h2 class="font-semibold text-xl text-gray-800 leading-tight">
            {{ __('Gestionar Cartas') }}
        </h2>
    </x-slot>
    @can('cards')
    <div class="py-12">
        <div class="max-w-7xl mx-auto sm:px-6 lg:px-8">
            <div class="bg-white overflow-hidden shadow-sm sm:rounded-lg">
                <div class="p-6 bg-white border-b border-gray-200">
                    <h1>Index de cards</h1>
                </div>
                <div>
                    <a class="btn btn-primary" href="{{ route('cards.create') }}">Crear carta</a>
                </div>
                <div class="card">
                    <div class="card-header">
                        {{--Aca se puede agregar el filtrador de datos--}}
                         <!-- input class="form-control" type="" -->
                    </div>
                    <div class="card-body">
                        <table class="table table-striped">
                            <thead>
                                <tr>
                                    <th>Nombre</th>
                                    <hr>
                                    <th>Imagen</th>
                                    <hr>
                                    <th>Rol</th>
                                    <hr>
                                    <th>Estado</th>
                                    <hr>
                                    <th>Acciones</th>
                                </tr>
                            </thead>
                            <tbody>
                            @foreach($cards as $card)
                                <tr>
                                    <td>{{ $card->name }}</td>
                                        <td>
                                            @if(!empty($card->photo))
                                                <span>Si hay imagen</span>
                                            @else
                                                <span>No hay imagen</span>
                                            @endif
                                        </td>
                                    <td>{{ $card->rol }}</td>
                                    <td>{{ $card->state }}</td>
                                        <td width="10px">
                                            <form method="POST" action="{{ route('cards.destroy', $card) }}">
                                            <a class="btn btn-primary" href="{{ route('cards.show',$card) }}">Ver</a>
                                            <a class="btn btn-primary" href="{{ route('cards.edit',$card) }}">Editar</a>
                                                @csrf
                                                @method('DELETE')
                                                <button type="submit">Eliminar</button>
                                            </form>
                                        </td>
                                </tr>
                            @endforeach
                            </tbody>
                        </table>
                    </div>
                    <div class="card-footer">
                        {{--Aca se pueden colocar los links de paginacion--}}
                    </div>
                </div>
            </div>
        </div>
    </div>
    @endcan

</x-app-layout>
