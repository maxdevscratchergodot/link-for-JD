extends Sprite2D

# Variables de movimiento
var velocidad = 200
var direccion = Vector2()

# Llamado en cada frame del juego
func _process(delta):
	# Obtener la entrada del teclado
	direccion = Vector2()  # ¡No reinicies la dirección aquí!

	if Input.is_action_pressed("ui_right"):
		direccion.x += 1
	if Input.is_action_pressed("ui_left"):
		direccion.x -= 1
	if Input.is_action_pressed("ui_down"):
		direccion.y += 1
	if Input.is_action_pressed("ui_up"):
		direccion.y -= 1

	# Normalizar la dirección para que el movimiento en diagonal no sea más rápido
	direccion = direccion.normalized()

	# Mover el personaje
	move_(direccion * velocidad)

