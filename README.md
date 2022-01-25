# Movimento_plataforma2d_player_Godot
movimentação para o player em jogos de plataforma 2d

O PROJETO CONSISTE EM FAZER O PLAYER SE MOVER PARA A DIREITA E ESQUERDA
AO PRESSIONAR OS BOTÕES DE AÇÂO.
==============================================================
Estrutura do player

-KinematicBody2D
-Sprite
-CollisionShape2D

°Adicionar uma sprite em Sprite para que o player fique visivel

°Adicionar um corpo ao collisionShape2D

==============================================================
Criação do script em KinematcBody2D

Variaveis:Gravidade,Speed,Velocidade,Direção,aceleraçãp

==============================================================

const gravidade = 4000|
const ACCEL = 0.4
var velocidade = Vector2.ZERO| 
var speed = 200

func _physic_process(delta:

	var dir = 0 #direção = o lado que o player esta indo se é igual a 1 é para direita se é -1 para a esquerda
	dir = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	if dir > 0:
		$Sprite.flip_h = false #flip h inverte a direçao do sprite
	if dir< 0:
		$Sprite.flip_h = true

	velocidade.y += gravidade * delta# aplicando a gravidade no player

	if dir != 0: #aqui estamos aplicando a aceleração para o player se mover
		velocidade.x = lerp(velocidade.x,speed*dir,ACCEL)
	else:
		if is_on_floor():#aqui estamos aplicando a desaceleração quando voce solta o botao
		velocidade.x = lerp(velocidade.x,0,ACCEL/2)


	velocidade = move_and_slide(velocidade,Vector2.UP) #aplicando a velocidade

