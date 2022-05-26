pragma solidity 0.4.24;

contract Sorteio {
    address private gerente;
    address[] private jogadores;
    address private vencedor;

    constructor() public {
        gerente = msg.sender;
    }

    function entrar() public payable {
        require(msg.value == 1 ether);
        jogadores.push(msg.sender);
    }
    
    function sortearGanhador() public restricted returns (address)  {
        uint index = random() % jogadores.length;
        vencedor = jogadores[index];
        vencedor.transfer(address(this).balance);
        return vencedor;
        limpar();
    }

    modifier restricted() {
        require(msg.sender == gerente);
        _;
    }

    function getJogadores() public view returns (address[]) {
        return jogadores;
    }

    function getGerente() public view returns (address) {
        return gerente;
    }

    function getSaldo() public view returns (uint) {
        return address(this).balance;
    }

    function limpar() private {
        jogadores = new address[](0);
    }

    function random() private view returns (uint) {
        return uint(keccak256(abi.encodePacked(block.difficulty, now, jogadores)));
    }
}