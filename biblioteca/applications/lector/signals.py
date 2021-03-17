



def update_libro_stok(sender, instance, **kwargs):
    # Actualizamos el stock si se elimina un prestamo
    instance.libro.stok += 1
    instance.libro.save() 

