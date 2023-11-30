extends CharacterBody2D

# Variables de movimiento
var velocidad = 210
var salto_velocidad = -3500  # Reduje la velocidad del salto
var gravedad = 5000  # Ajusta según tus necesidades
var friccion = 0.60  # Ajusta según tus necesidades (valor mayor para más fricción)
var en_suelo = false 

# Velocidad actual del personaje
var velocidad_actual = Vector2()

# Llamado en cada frame del juego
func _physics_process(delta):
	# Obtener la entrada del teclado
	var direccion = Vector2()

	if Input.is_action_pressed("ui_right"):
		direccion.x += 1
	if Input.is_action_pressed("ui_left"):
		direccion.x -= 1

	# Normalizar la dirección para que el movimiento en diagonal no sea más rápido
	direccion = direccion.normalized()

	# Aplicar la fricción
	velocidad_actual = velocidad_actual * friccion

	# Aplicar la gravedad
	if not en_suelo:
		velocidad_actual.y += gravedad * delta

	# Mover el personaje usando translate
	var nueva_posicion = position + velocidad_actual * delta
	if not is_colliding(nueva_posicion):
		position = nueva_posicion

	# Verificar si el personaje está en el suelo
	en_suelo = is_on_floor()

	# Si se presiona la tecla de flecha arriba o la tecla de espacio y el personaje está en el suelo, realizar un salto
	if (Input.is_action_pressed("ui_up") or Input.is_action_pressed("Jump")) and en_suelo:
		velocidad_actual.y = salto_velocidad

	# Aplicar la velocidad de movimiento
	velocidad_actual += direccion * velocidad
	
	move_and_slide()

# Función para verificar colisiones
func is_colliding(posicion_nueva: Vector2) -> bool:
	# Lógica de colisiones personalizada aquí
	# Devuelve true si hay una colisión, de lo contrario, devuelve false
	return false


