// SPDX-License-Identifier: MIT

// FIAP - Smart Contract Classes

// Instrucao obrigatoria para informar com qual versao do compilador solidity o codigo fonte e compativel
pragma solidity 0.5.16;

// Criada a classe contract (objeto sera criado no momento da publicacao do contrato)
contract SimpleStorage {
    // Declaracao de atributo
    // <tipo de dado> <nome do atributo>
    // uint = Unsigned Integer (Numero inteiro sem sinal)
    uint256 storedData;

    // metodo set(), responsavel por armazenar um numero em storedData
    // public define a visibilidade da funcao
    function set(uint256 x) public {
        storedData = x;
    }

    // metodo get(), responsavel em exibir o numero.
    // public define a visibilidade da funcao
    // returns indica que a funcao esta retornando, seguida pelo tipo de dado "(uint)"
    function get() public view returns (uint256) {
        //palavra reservada "view", indicando que e um metodo apenas de visualizacao
        return storedData;
    }
}
