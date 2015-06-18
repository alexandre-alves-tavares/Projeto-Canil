/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */



$(document).ready(function () {
    $('form').bootstrapValidator({
        message: 'This value is not valid',
        feedbackIcons: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields: {
            pesquisa: {
                message: 'The username is not valid',
                validators: {
                    notEmpty: {
                        message: 'A pesquisa N&Atilde;O pode ser feita com o campo vazio.'
                    },
                    stringLength: {
                        min: 3,
                        max: 30,
                        message: 'O minimo de letras para fazer uma pesquisa s&atilde;o 3 letras.'
                    }
                }
            },
            nome: {
                message: 'The username is not valid',
                validators: {
                    notEmpty: {
                        message: 'O cadastro N&Atilde;O pode ser feito com o campo nome vazio.'
                    },
                    stringLength: {
                        min: 3,
                        message: 'O minimo de letras para cadastrar nome s&atilde;o 3 letras.'
                    },
                    regexp: {
                        regexp: /^[a-zA-Z0-9\s]+$/,
                        message: 'O nome deve conter somente letras, numeros e espaços.'
                    }
                }
            },
            idade: {
                message: 'The username is not valid',
                validators: {
                    notEmpty: {
                        message: 'O cadastro N&Atilde;O pode ser feito com o campo idade vazio.'
                    },
                    regexp: {
                        regexp: /^[0-9]+$/,
                        message: 'A idade deve conter somente numeros.'
                    }
                }
            },
            raca: {
                message: 'The username is not valid',
                validators: {
                    notEmpty: {
                        message: 'O cadastro N&Atilde;O pode ser feito com o campo raça vazio.'
                    },
                    stringLength: {
                        min: 3,
                        message: 'O minimo de letras para cadastrar raça s&atilde;o 3 letras.'
                    },
                    regexp: {
                        regexp: /^[a-zA-Z\s]+$/,
                        message: 'A raça deve conter somente letras e espaços.'
                    }
                }
            },
            tipo: {
                validators: {
                    notEmpty: {
                        message: 'É necessário escolher o tipo.'
                    }
                }
            },
            peso: {
                message: 'The username is not valid',
                validators: {
                    notEmpty: {
                        message: 'O cadastro N&Atilde;O pode ser feito com o campo peso vazio.'
                    },
                    regexp: {
                        regexp: /^[0-9,]+$/,
                        message: 'O peso deve conter somente numeros e virgula.'
                    }
                }
            },
            agressivo: {
                validators: {
                    notEmpty: {
                        message: 'É necessário escolher se é agressivo ou não.'
                    }
                }
            },
            racao: {
                message: 'The username is not valid',
                validators: {
                    notEmpty: {
                        message: 'O cadastro N&Atilde;O pode ser feito com o campo ração vazio.'
                    },
                    stringLength: {
                        min: 3,
                        message: 'O minimo de letras para cadastrar ração s&atilde;o 3 letras.'
                    },
                    regexp: {
                        regexp: /^[a-zA-Z\s]+$/,
                        message: 'A ração deve conter somente letras e espaços.'
                    }
                }
            },
            bairro: {
                message: 'The username is not valid',
                validators: {
                    notEmpty: {
                        message: 'O cadastro N&Atilde;O pode ser feito com o campo bairro vazio.'
                    },
                    stringLength: {
                        min: 3,
                        message: 'O minimo de letras para cadastrar bairro s&atilde;o 3 letras.'
                    },
                    regexp: {
                        regexp: /^[a-zA-Z\s]+$/,
                        message: 'O bairro deve conter somente letras e espaços.'
                    }
                }
            },
            sexo: {
                validators: {
                    notEmpty: {
                        message: 'É necessário escolher o sexo.'
                    }
                }
            },
            pelagem: {
                validators: {
                    notEmpty: {
                        message: 'É necessário escolher a pelagem.'
                    }
                }
            },
            cor: {
                validators: {
                    notEmpty: {
                        message: 'É necessário escolher a cor.'
                    }
                }
            },
            doses: {
                message: 'The username is not valid',
                validators: {
                    notEmpty: {
                        message: 'O cadastro N&Atilde;O pode ser feito com o campo doses vazio.'
                    },
                    regexp: {
                        regexp: /^[0-9]+$/,
                        message: 'A dose deve conter somente numeros.'
                    }
                }
            },
            descricao: {
                message: 'The username is not valid',
                validators: {
                    notEmpty: {
                        message: 'O cadastro N&Atilde;O pode ser feito com o campo descrição vazio.'
                    },
                    stringLength: {
                        min: 10,
                        message: 'O minimo de letras para cadastrar descrição s&atilde;o 10 letras.'
                    },
                    regexp: {
                        regexp: /^[a-zA-Z0-9\s]+$/,
                        message: 'a descrição deve conter somente letras, numeros e espaços.'
                    }
                }
            },
            email: {
                validators: {
                    notEmpty: {
                        message: 'O cadastro N&Atilde;O pode ser feito com o campo email vazio.'
                    },
                    emailAddress: {
                        message: 'O conteúdo inserido não é um email válido.'
                    }
                }
            },
            cpf: {
                message: 'The username is not valid',
                validators: {
                    notEmpty: {
                        message: 'O cadastro N&Atilde;O pode ser feito com o campo CPF vazio.'
                    },
                    stringLength: {
                        min: 11,
                        max: 11,
                        message: 'O CPF tem 11 digitos'
                    },
                    regexp: {
                        regexp: /^[0-9]+$/,
                        message: 'A CPF deve conter somente numeros. SEM traços e pontos'
                    }
                }
            },
            endereco: {
                message: 'The username is not valid',
                validators: {
                    notEmpty: {
                        message: 'O cadastro N&Atilde;O pode ser feito com o campo endereço vazio.'
                    },
                    stringLength: {
                        min: 6,
                        message: 'O minimo de letras para cadastrar endereço s&atilde;o 6 letras.'
                    },
                    regexp: {
                        regexp: /^[a-zA-Z0-9\s,]+$/,
                        message: 'a descrição deve conter somente letras, numeros, virgulas e espaços.'
                    }
                }
            },
            telefone: {
                message: 'The username is not valid',
                validators: {
                    notEmpty: {
                        message: 'O cadastro N&Atilde;O pode ser feito com o campo telefone vazio.'
                    },
                    regexp: {
                        regexp: /^[0-9]+$/,
                        message: 'O telefone deve conter somente numeros. SEM virgulas, espaços e parenteses.'
                    }
                }
            },
            crmv: {
                message: 'The username is not valid',
                validators: {
                    notEmpty: {
                        message: 'O cadastro N&Atilde;O pode ser feito com o campo CRMV vazio.'
                    },
                    regexp: {
                        regexp: /^[0-9]+$/,
                        message: 'O CRMV deve conter somente numeros. SEM virgulas, espaços e parenteses.'
                    }
                }
            },
            usuario: {
                message: 'The username is not valid',
                validators: {
                    notEmpty: {
                        message: 'O cadastro N&Atilde;O pode ser feito com o campo usuário vazio.'
                    },
                    stringLength: {
                        min: 6,
                        max: 30,
                        message: 'O usuário é maior que 6 caracteres e menor que 30 caracteres.'
                    },
                    regexp: {
                        regexp: /^[a-zA-Z0-9_.-]+$/,
                        message: 'O usuário contém somente letras, numeros, traços e ponto. '
                    }
                }
            },
            senha: {
                validators: {
                    notEmpty: {
                        message: 'O cadastro N&Atilde;O pode ser feito com o campo senha vazio.'
                    },
                    identical: {
                        field: 'confirmasenha',
                        message: 'A senha e a confirmação de senha não são iguais.'
                    }
                }
            },
            confirmasenha: {
                validators: {
                    notEmpty: {
                        message: 'O cadastro N&Atilde;O pode ser feito com o confirmar senha vazio.'
                    },
                    identical: {
                        field: 'senha',
                        message: 'A senha e a confirmação de senha não são iguais.'
                    }
                }
            },
            codigo_animal: {
                message: 'The username is not valid',
                validators: {
                    notEmpty: {
                        message: 'O cadastro N&Atilde;O pode ser feito com o campo código vazio.'
                    },
                    regexp: {
                        regexp: /^[0-9]+$/,
                        message: 'O código deve conter somente numeros. SEM virgulas, espaços e parenteses.'
                    }
                }
            }
        }
    });
});