 class Aluno {

    private idAluno: number = 0;
    private ra: string = "";
    private nome: string;
    private sobrenome: string;
    private dataNascimento: Date;
    private endereco: string;
    private email: string;
    private celular: string;

    constructor (_nome:string, _sobrenome:string, _dataNascimento: Date, _endereco:string,  
                 _email:string, _celular:string){

        this.nome = _nome;
        this.sobrenome = _sobrenome;
        this.dataNascimento = _dataNascimento;
        this.endereco = _endereco;
        this.email = _email;
        this.celular = _celular;
    }



    public getId (): number{
        return this.idAluno;
    }

    public setId (_idAluno:number): void{
        this.idAluno = _idAluno;
    }


}