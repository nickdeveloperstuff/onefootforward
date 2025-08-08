defmodule SuperdupernovaWeb.CarouselTestLive do
  use SuperdupernovaWeb, :live_view
  use SuperdupernovaWeb.Widgets
  
  import SuperdupernovaWeb.Widgets.Display

  @impl true
  def render(assigns) do
    ~H"""
    <div class="p-8 bg-base-100 min-h-screen">
      <h1 class="text-3xl font-bold mb-8">Carousel Widget Test - Phase 3</h1>
      
      <!-- Basic Carousel with Slides -->
      <div class="mb-12">
        <h2 class="text-2xl font-semibold mb-4">Basic Carousel</h2>
        <.carousel>
          <:slide id="slide1">
            <div class="h-64 bg-gradient-to-r from-primary to-secondary flex items-center justify-center text-white">
              <div class="text-center">
                <h3 class="text-2xl font-bold mb-2">Slide 1</h3>
                <p>Welcome to our carousel component</p>
              </div>
            </div>
          </:slide>
          <:slide id="slide2">
            <div class="h-64 bg-gradient-to-r from-secondary to-accent flex items-center justify-center text-white">
              <div class="text-center">
                <h3 class="text-2xl font-bold mb-2">Slide 2</h3>
                <p>Beautiful transitions between slides</p>
              </div>
            </div>
          </:slide>
          <:slide id="slide3">
            <div class="h-64 bg-gradient-to-r from-accent to-info flex items-center justify-center text-white">
              <div class="text-center">
                <h3 class="text-2xl font-bold mb-2">Slide 3</h3>
                <p>Fully customizable content</p>
              </div>
            </div>
          </:slide>
          <:slide id="slide4">
            <div class="h-64 bg-gradient-to-r from-info to-success flex items-center justify-center text-white">
              <div class="text-center">
                <h3 class="text-2xl font-bold mb-2">Slide 4</h3>
                <p>Smooth navigation controls</p>
              </div>
            </div>
          </:slide>
        </.carousel>
      </div>

      <!-- Carousel with Dots Navigation -->
      <div class="mb-12">
        <h2 class="text-2xl font-semibold mb-4">Carousel with Dot Navigation</h2>
        <.carousel_with_dots>
          <:slide id="dot-slide1">
            <div class="h-64 bg-warning flex items-center justify-center">
              <div class="text-center text-warning-content">
                <h3 class="text-2xl font-bold mb-2">Product 1</h3>
                <p>Amazing features await</p>
              </div>
            </div>
          </:slide>
          <:slide id="dot-slide2">
            <div class="h-64 bg-error flex items-center justify-center">
              <div class="text-center text-error-content">
                <h3 class="text-2xl font-bold mb-2">Product 2</h3>
                <p>Revolutionary design</p>
              </div>
            </div>
          </:slide>
          <:slide id="dot-slide3">
            <div class="h-64 bg-success flex items-center justify-center">
              <div class="text-center text-success-content">
                <h3 class="text-2xl font-bold mb-2">Product 3</h3>
                <p>Best in class performance</p>
              </div>
            </div>
          </:slide>
        </.carousel_with_dots>
      </div>

      <!-- Carousel with Thumbnail Navigation -->
      <div class="mb-12">
        <h2 class="text-2xl font-semibold mb-4">Carousel with Thumbnail Navigation</h2>
        <.carousel_with_thumbnails>
          <:slide id="thumb-slide1" thumbnail="/images/thumb1.jpg">
            <div class="h-96 bg-base-200 flex items-center justify-center">
              <div class="text-center">
                <svg class="w-32 h-32 mx-auto mb-4" fill="currentColor" viewBox="0 0 20 20">
                  <path d="M10 12a2 2 0 100-4 2 2 0 000 4z"/>
                  <path fill-rule="evenodd" d="M.458 10C1.732 5.943 5.522 3 10 3s8.268 2.943 9.542 7c-1.274 4.057-5.064 7-9.542 7S1.732 14.057.458 10zM14 10a4 4 0 11-8 0 4 4 0 018 0z" clip-rule="evenodd"/>
                </svg>
                <h3 class="text-2xl font-bold mb-2">Gallery Image 1</h3>
                <p>High resolution photography</p>
              </div>
            </div>
          </:slide>
          <:slide id="thumb-slide2" thumbnail="/images/thumb2.jpg">
            <div class="h-96 bg-base-300 flex items-center justify-center">
              <div class="text-center">
                <svg class="w-32 h-32 mx-auto mb-4" fill="currentColor" viewBox="0 0 20 20">
                  <path fill-rule="evenodd" d="M4 3a2 2 0 00-2 2v10a2 2 0 002 2h12a2 2 0 002-2V5a2 2 0 00-2-2H4zm12 12H4l4-8 3 6 2-4 3 6z" clip-rule="evenodd"/>
                </svg>
                <h3 class="text-2xl font-bold mb-2">Gallery Image 2</h3>
                <p>Beautiful landscapes</p>
              </div>
            </div>
          </:slide>
          <:slide id="thumb-slide3" thumbnail="/images/thumb3.jpg">
            <div class="h-96 bg-base-200 flex items-center justify-center">
              <div class="text-center">
                <svg class="w-32 h-32 mx-auto mb-4" fill="currentColor" viewBox="0 0 20 20">
                  <path fill-rule="evenodd" d="M3 5a1 1 0 011-1h12a1 1 0 110 2H4a1 1 0 01-1-1zM3 10a1 1 0 011-1h12a1 1 0 110 2H4a1 1 0 01-1-1zM3 15a1 1 0 011-1h12a1 1 0 110 2H4a1 1 0 01-1-1z" clip-rule="evenodd"/>
                </svg>
                <h3 class="text-2xl font-bold mb-2">Gallery Image 3</h3>
                <p>Professional portfolio</p>
              </div>
            </div>
          </:slide>
        </.carousel_with_thumbnails>
      </div>

      <!-- Carousel with Auto-play -->
      <div class="mb-12">
        <h2 class="text-2xl font-semibold mb-4">Carousel with Auto-play</h2>
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

      <!-- Carousel Variations -->
      <div class="mb-12">
        <h2 class="text-2xl font-semibold mb-4">Carousel Variations</h2>
        
        <!-- Full Width Carousel -->
        <div class="mb-8">
          <h3 class="text-lg font-semibold mb-2">Full Width</h3>
          <.carousel full_width={true}>
            <:slide id="full-slide1">
              <div class="h-48 bg-primary flex items-center justify-center text-primary-content">
                <p class="text-xl">Full Width Slide 1</p>
              </div>
            </:slide>
            <:slide id="full-slide2">
              <div class="h-48 bg-secondary flex items-center justify-center text-secondary-content">
                <p class="text-xl">Full Width Slide 2</p>
              </div>
            </:slide>
          </.carousel>
        </div>

        <!-- Centered Carousel -->
        <div class="mb-8">
          <h3 class="text-lg font-semibold mb-2">Centered</h3>
          <.carousel centered={true}>
            <:slide id="center-slide1">
              <div class="h-48 bg-accent flex items-center justify-center text-accent-content">
                <p class="text-xl">Centered Slide 1</p>
              </div>
            </:slide>
            <:slide id="center-slide2">
              <div class="h-48 bg-info flex items-center justify-center text-info-content">
                <p class="text-xl">Centered Slide 2</p>
              </div>
            </:slide>
          </.carousel>
        </div>

        <!-- Vertical Carousel -->
        <div class="mb-8">
          <h3 class="text-lg font-semibold mb-2">Vertical</h3>
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
      </div>

      <!-- Image Carousel -->
      <div class="mb-12">
        <h2 class="text-2xl font-semibold mb-4">Image Carousel</h2>
        <.carousel>
          <:slide id="img-slide1">
            <img src="https://via.placeholder.com/800x400/FF6B6B/FFFFFF?text=Image+1" alt="Slide 1" class="w-full" />
          </:slide>
          <:slide id="img-slide2">
            <img src="https://via.placeholder.com/800x400/4ECDC4/FFFFFF?text=Image+2" alt="Slide 2" class="w-full" />
          </:slide>
          <:slide id="img-slide3">
            <img src="https://via.placeholder.com/800x400/45B7D1/FFFFFF?text=Image+3" alt="Slide 3" class="w-full" />
          </:slide>
        </.carousel>
      </div>
    </div>
    """
  end

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end
end