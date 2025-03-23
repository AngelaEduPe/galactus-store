<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="models.Producto" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>GALACTUS STORE | Detalle del Producto</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-100">

    <% Producto producto = (Producto) request.getAttribute("producto"); %>
    <% List<String> imagenes = (List<String>) request.getAttribute("imagenes"); %>


    <header>
        <div class="flex gap-4 bg-green-600 justify-center h-[50px] items-center shadow-md">
            <a href="/galactus-store" class="text-white hover:bg-green-700 px-4 py-2 rounded-md">Inicio</a>
            <a href="/galactus-store/categorias" class="text-white hover:bg-green-700 px-4 py-2 rounded-md border border-white">Categorías</a>
            <a class="text-white hover:bg-green-700 px-4 py-2 rounded-md">Marcas</a>
        </div>
    </header>

   
    <main class="p-8">
        <div class="max-w-5xl mx-auto bg-white rounded-lg shadow-md p-6 flex flex-col md:flex-row gap-8">
            <!-- Imagen principal y miniaturas -->
            <div class="flex flex-col items-center w-full md:w-1/2">
                <% if (imagenes != null && !imagenes.isEmpty()) { %>
                    <img id="imagen-carrusel" 
                         src="<%= imagenes.get(0) %>" 
                         alt="Imagen principal"
                         class="rounded-lg shadow-lg w-full max-w-[500px] h-[500px] object-cover transition-all duration-300 hover:scale-105">
                <% } %>
                
                <!-- Indicadores -->
                <div class="flex justify-center gap-2 mt-2">
                    <% for (int i = 0; i < imagenes.size(); i++) { %>
                        <span class="w-[12px] h-[12px] rounded-full bg-gray-400 cursor-pointer hover:bg-green-600"
                            onclick="cambiarImagen(<%= i %>)"></span>
                    <% } %>
                </div>

                <!-- Miniaturas -->
                <div class="flex gap-2 justify-center mt-4">
                    <% for (int i = 0; i < imagenes.size(); i++) { %>
                        <img src="<%= imagenes.get(i) %>" 
                             class="w-[60px] h-[60px] rounded-lg border cursor-pointer 
                                    hover:border-green-600 object-cover transition-transform duration-300 hover:scale-110"
                             onclick="cambiarImagen(<%= i %>)" alt="Miniatura <%= i + 1 %>">
                    <% } %>
                </div>
            </div>

            <!-- Detalles del producto -->
            <div class="flex flex-col justify-center w-full md:w-1/2 gap-4">
                <h2 class="text-3xl font-bold text-gray-800"><%= producto.getNombre() %></h2>
                <p class="text-gray-600"><strong>Modelo:</strong> <%= producto.getModelo() %></p>
                <p class="text-gray-600"><strong>Garantía:</strong> <%= producto.getTiempoGarantiaMeses() %> meses</p>
                <p class="text-gray-600"><strong>Marca:</strong> <%= request.getAttribute("marca_nombre") %></p>
                <p class="text-gray-600"><strong>Proveedor:</strong> <%= request.getAttribute("proveedor_nombre") %></p>

                <div class="flex items-center gap-4">
                    <p class="text-2xl font-bold text-green-600">S/. <%= producto.getPrecio() %></p>
                    <p class="text-red-500"><strong>Stock:</strong> <%= producto.getStock() %> unidades</p>
                </div>

                <!-- Botón de compra -->
                <button class="bg-green-600 text-white font-bold py-2 px-4 rounded-lg hover:bg-green-700 transition-all duration-300">
                    Agregar al Carrito 🛒
                </button>
            </div>
        </div>

        <!-- Descripción -->
        <div class="max-w-5xl mx-auto bg-white mt-8 rounded-lg shadow-md p-6">
            <h3 class="text-2xl font-semibold text-gray-800">Descripción</h3>
            <p class="mt-2 text-gray-600"><%= producto.getDescripcion() %></p>
        </div>
    </main>

    <!-- Pie de pagina -->
    <footer class="bg-gray-800 text-white text-center p-4 mt-8">
        <p>&copy; 2025 Galactus Store. Todos los derechos reservados.</p>
    </footer>

    <script>
        // Genera la lista de imágenes
        const imagenes = [
            <% for (String imagen : imagenes) { %>
                "<%= imagen %>",
            <% } %>
        ];

        // Cambia la imagen principal
        function cambiarImagen(index) {
            const imagenPrincipal = document.getElementById('imagen-carrusel');
            imagenPrincipal.src = imagenes[index];
        }
    </script>
</body>
</html>
