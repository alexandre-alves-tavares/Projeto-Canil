/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

$(document).ready(function() {
    $('form').bootstrapValidator({
        message: 'This value is not valid',
        feedbackIcons: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields: {
            usuario: {
                message: 'The username is not valid',
                validators: {
                    notEmpty: {
                        message: 'O usuário é requerido NÂO pode estar vazio.'
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
                        message: 'A senha é requerida e NÂO pode estar vazia'
                    }
                    
                }
            }
        }
    });
});