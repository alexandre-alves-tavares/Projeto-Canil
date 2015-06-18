<h3> Prontuário </h3>
<p class="barra" > </p>
<form metho="POST" action="">
    <p>
        <label> Animal: </label>
        <input type="text" name="codigo" />
        <input type="text" name="nome" />
    </p>
    <p>
        <label> Anaminésia: </label>
        <textarea> </textarea>
    </p>
    <p>
        <label> Microchip: </label>
        <input type="text" name="microchip" />
    </p>
    <p>
        <label> Alimentação: </label>
        <select name="alimentacao" >
            <option id="p"> Pequeno </option>
            <option id="m"> Médio </option>
            <option id="g"> Grande </option>
            <option id="a"> Amamentação </option>
            <option id="o"> Outros </option>
        </select>
    </p>
    <h3> Vacinas </h3>
    <p class="barra" > </p>
    <p>
        <label> Nome: </label>
        <select id="nome" >
            <option id="a"> Vacina A </option>
            <option id="b"> Vacina B </option>
            <option id="c"> Vacina C </option>
            <option id="d"> Vacina D </option>
            <option id="e"> Vacina E </option>
            <option id="f"> Vacina F </option>
            <option id="g"> Vacina G </option>
            <option id="h"> Vacina H </option>
            <option id="i"> Vacina I </option> 
        </select>
    </p>
    <p>
        <label> Número de doses no total: </label>
        <input type="number" value="1" min="1"  name="frequencia" />
    </p>
    <p>
        <label> Frequencia: </label>
        <select name="periodo">
            <option> 1x ao dia </option>
            <option> 2x ao dia </option>
            <option> 3x ao dia </option>
            <option> 4x ao dia </option>
            <option> Nx ao dia </option>
            <option> Semanalmente </option>
            <option> 15 dias </option>
            <option> Mensalmente </option>
            <option> Outros </option>  
        </select>
    </p>
    <p>
        <label> Data: </label>
        <input type="date" name="data" />
    </p>
    <p>
        <input type="submit" value="Cadastrar" />
    </p>
</form>