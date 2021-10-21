@csrf
<div>
    <label for="name">Nombre</label>
        <input id="name" class="block mt-1 w-full" type="text" name="name" value="{{ old('name', $card->name) }}" required autofocus />
        <div>
            <label for="photo">Foto</label>
                <input id="photo" class="block" type="file" name="photo" required/>
        </div>
    <label for="rol">Rol</label>
        <select name="rol" id="rol" required>
            <option value="" >Seleccione</option>
            <option value="Programadores"{{ old('rol', $card->rol)== 'Programadores'? 'selected': ''}}>Programadores</option>
            <option value="Modulo" {{ old('rol', $card->rol)== 'Modulo'? 'selected': ''}}>Modulo</option>
            <option value="Tipo de Error" {{ old('rol', $card->rol)== 'Tipo de Error'? 'selected': ''}}>Tipo de Error</option>
        </select>
    <label for="state">Estado</label>
        <select name="state" id="state" required>
            <option value="">Seleccione</option>
            <option value="Activo" {{ old('rol', $card->state)== 'Activo'? 'selected': ''}}>Activo</option>
            <option value="Inactivo" {{ old('rol', $card->state)== 'Inactivo'? 'selected': ''}}>Inactivo</option>
        </select>
</div>
<div class="flex items-center justify-end mt-4">
    <a href="{{ route('cards.index') }}">Cancelar</a>
    <hr>
    <button type="submit" class="ml-4">
        {{ $btnText }}
    </button>
</div>
