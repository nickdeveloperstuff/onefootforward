defmodule SuperdupernovaWeb.CarouselTestLive do
  use SuperdupernovaWeb, :live_view
  use SuperdupernovaWeb.Widgets
  
  import SuperdupernovaWeb.Widgets.Display

  @impl true
  def render(assigns) do
    ~H"""
    <div class="lego-page">
      <.lego_container>
        <h1 class="text-3xl font-bold mb-8">Carousel Widget Test - Phase 3</h1>
        
        <!-- Basic Carousel with Slides -->
        <h2 class="text-2xl font-semibold mb-4">Basic Carousel</h2>
        <.lego_grid>
          <div class="widget-12x4">
            <.carousel id="basic-carousel">
              <:slides>
                <div class="h-64 bg-gradient-to-r from-primary to-secondary flex items-center justify-center text-white">
                  <div class="text-center">
                    <h3 class="text-2xl font-bold mb-2">Slide 1</h3>
                    <p>Welcome to our carousel component</p>
                  </div>
                </div>
              </:slides>
              <:slides>
                <div class="h-64 bg-gradient-to-r from-secondary to-accent flex items-center justify-center text-white">
                  <div class="text-center">
                    <h3 class="text-2xl font-bold mb-2">Slide 2</h3>
                    <p>Beautiful transitions between slides</p>
                  </div>
                </div>
              </:slides>
              <:slides>
                <div class="h-64 bg-gradient-to-r from-accent to-info flex items-center justify-center text-white">
                  <div class="text-center">
                    <h3 class="text-2xl font-bold mb-2">Slide 3</h3>
                    <p>Fully customizable content</p>
                  </div>
                </div>
              </:slides>
              <:slides>
                <div class="h-64 bg-gradient-to-r from-info to-success flex items-center justify-center text-white">
                  <div class="text-center">
                    <h3 class="text-2xl font-bold mb-2">Slide 4</h3>
                    <p>Smooth navigation controls</p>
                  </div>
                </div>
              </:slides>
            </.carousel>
          </div>
        </.lego_grid>

        <!-- Carousel with Dots Navigation -->
        <h2 class="text-2xl font-semibold mb-4 mt-unit-4">Carousel with Dot Navigation</h2>
        <.lego_grid>
          <div class="widget-12x4">
            <.carousel_with_dots 
              id="dots-carousel" 
              slides={[
                %{content: "Dot Slide 1 - Amazing features await"},
                %{content: "Dot Slide 2 - Revolutionary design"},
                %{content: "Dot Slide 3 - Best in class performance"}
              ]} 
            />
          </div>
        </.lego_grid>

        <!-- Carousel with Thumbnail Navigation -->
        <h2 class="text-2xl font-semibold mb-4 mt-unit-4">Carousel with Thumbnail Navigation</h2>
        <.lego_grid>
          <div class="widget-12x6">
            <.carousel_with_thumbnails 
              id="thumb-carousel" 
              images={[
                %{src: "https://via.placeholder.com/800x400/FF6B6B/FFFFFF?text=Gallery+1", alt: "Gallery 1", thumbnail: "https://via.placeholder.com/150x75/FF6B6B/FFFFFF?text=Thumb+1"},
                %{src: "https://via.placeholder.com/800x400/4ECDC4/FFFFFF?text=Gallery+2", alt: "Gallery 2", thumbnail: "https://via.placeholder.com/150x75/4ECDC4/FFFFFF?text=Thumb+2"},
                %{src: "https://via.placeholder.com/800x400/45B7D1/FFFFFF?text=Gallery+3", alt: "Gallery 3", thumbnail: "https://via.placeholder.com/150x75/45B7D1/FFFFFF?text=Thumb+3"}
              ]} 
            />
          </div>
        </.lego_grid>

        <!-- Carousel with Auto-play -->
        <h2 class="text-2xl font-semibold mb-4 mt-unit-4">Carousel with Auto-play</h2>
        <.lego_grid>
          <div class="widget-12x4">
            <div id="carousel-autoplay" class="carousel w-full" phx-hook="CarouselAutoPlay" data-interval="3000">
              <div id="auto-slide1" class="carousel-item relative w-full">
                <div class="h-64 w-full bg-gradient-to-r from-purple-400 to-pink-600 flex items-center justify-center text-white">
                  <div class="text-center">
                    <h3 class="text-2xl font-bold mb-2">Auto Slide 1</h3>
                    <p>Automatically transitions every 3 seconds</p>
                  </div>
                </div>
                <div class="absolute flex justify-between transform -translate-y-1/2 left-5 right-5 top-1/2">
                  <a href="#auto-slide3" class="btn btn-circle">❮</a> 
                  <a href="#auto-slide2" class="btn btn-circle">❯</a>
                </div>
              </div>
              <div id="auto-slide2" class="carousel-item relative w-full">
                <div class="h-64 w-full bg-gradient-to-r from-green-400 to-blue-600 flex items-center justify-center text-white">
                  <div class="text-center">
                    <h3 class="text-2xl font-bold mb-2">Auto Slide 2</h3>
                    <p>Smooth automatic transitions</p>
                  </div>
                </div>
                <div class="absolute flex justify-between transform -translate-y-1/2 left-5 right-5 top-1/2">
                  <a href="#auto-slide1" class="btn btn-circle">❮</a> 
                  <a href="#auto-slide3" class="btn btn-circle">❯</a>
                </div>
              </div>
              <div id="auto-slide3" class="carousel-item relative w-full">
                <div class="h-64 w-full bg-gradient-to-r from-yellow-400 to-red-600 flex items-center justify-center text-white">
                  <div class="text-center">
                    <h3 class="text-2xl font-bold mb-2">Auto Slide 3</h3>
                    <p>Pause on hover functionality</p>
                  </div>
                </div>
                <div class="absolute flex justify-between transform -translate-y-1/2 left-5 right-5 top-1/2">
                  <a href="#auto-slide2" class="btn btn-circle">❮</a> 
                  <a href="#auto-slide1" class="btn btn-circle">❯</a>
                </div>
              </div>
            </div>
          </div>
        </.lego_grid>

        <!-- Carousel Variations -->
        <h2 class="text-2xl font-semibold mb-4 mt-unit-4">Carousel Variations</h2>
        
        <!-- Full Width Carousel -->
        <h3 class="text-lg font-semibold mb-2">Full Width</h3>
        <.lego_grid>
          <div class="widget-12x2">
            <.carousel id="full-width-carousel">
              <:slides>
                <div class="h-48 bg-primary flex items-center justify-center text-primary-content">
                  <p class="text-xl">Full Width Slide 1</p>
                </div>
              </:slides>
              <:slides>
                <div class="h-48 bg-secondary flex items-center justify-center text-secondary-content">
                  <p class="text-xl">Full Width Slide 2</p>
                </div>
              </:slides>
            </.carousel>
          </div>
        </.lego_grid>

        <!-- Centered Carousel -->
        <h3 class="text-lg font-semibold mb-2 mt-unit-4">Centered</h3>
        <.lego_grid>
          <div class="widget-12x2">
            <.carousel id="centered-carousel">
              <:slides>
                <div class="h-48 bg-accent flex items-center justify-center text-accent-content">
                  <p class="text-xl">Centered Slide 1</p>
                </div>
              </:slides>
              <:slides>
                <div class="h-48 bg-info flex items-center justify-center text-info-content">
                  <p class="text-xl">Centered Slide 2</p>
                </div>
              </:slides>
            </.carousel>
          </div>
        </.lego_grid>

        <!-- Vertical Carousel -->
        <h3 class="text-lg font-semibold mb-2 mt-unit-4">Vertical</h3>
        <.lego_grid>
          <div class="widget-12x6">
            <div class="carousel carousel-vertical h-96 w-full">
              <div id="vert-slide1" class="carousel-item h-full">
                <div class="h-full w-full bg-warning flex items-center justify-center text-warning-content">
                  <p class="text-xl">Vertical Slide 1</p>
                </div>
              </div>
              <div id="vert-slide2" class="carousel-item h-full">
                <div class="h-full w-full bg-error flex items-center justify-center text-error-content">
                  <p class="text-xl">Vertical Slide 2</p>
                </div>
              </div>
              <div id="vert-slide3" class="carousel-item h-full">
                <div class="h-full w-full bg-success flex items-center justify-center text-success-content">
                  <p class="text-xl">Vertical Slide 3</p>
                </div>
              </div>
            </div>
          </div>
        </.lego_grid>

        <!-- Image Carousel -->
        <h2 class="text-2xl font-semibold mb-4 mt-unit-4">Image Carousel</h2>
        <.lego_grid>
          <div class="widget-12x4">
            <.carousel id="image-carousel">
              <:slides>
                <img src="https://via.placeholder.com/800x400/FF6B6B/FFFFFF?text=Image+1" alt="Slide 1" class="w-full" />
              </:slides>
              <:slides>
                <img src="https://via.placeholder.com/800x400/4ECDC4/FFFFFF?text=Image+2" alt="Slide 2" class="w-full" />
              </:slides>
              <:slides>
                <img src="https://via.placeholder.com/800x400/45B7D1/FFFFFF?text=Image+3" alt="Slide 3" class="w-full" />
              </:slides>
            </.carousel>
          </div>
        </.lego_grid>
      </.lego_container>
    </div>
    """
  end

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end
end