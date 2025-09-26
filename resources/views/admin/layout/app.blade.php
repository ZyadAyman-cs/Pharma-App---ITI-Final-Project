<!DOCTYPE html>
<html lang="ar" dir="rtl">
<head>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>pharamcy app </title>
    <script src="https://cdn.tailwindcss.com"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <script>
        tailwind.config = {
            theme: {
                extend: {
                    colors: {
                        primary: '#1e40af',
                        secondary: '#1e3a8a',
                        accent: '#f59e0b'
                    }
                }
            }
        }
    </script>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Tajawal:wght@300;400;500;700&display=swap');

        * {
            font-family: 'Tajawal', sans-serif;
        }

        .animate-fade-in {
            animation: fadeIn 0.6s ease-in-out;
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(10px); }
            to { opacity: 1; transform: translateY(0); }
        }

        .active-nav {
            position: relative;
            font-weight: 700;
        }

        .active-nav::after {
            content: '';
            position: absolute;
            bottom: -6px;
            left: 0;
            right: 0;
            height: 3px;
            background-color: #fbbf24;
            border-radius: 3px;
        }

        .task-card {
            transition: all 0.3s ease;
        }

        .task-card:hover {
            transform: translateY(-3px);
            box-shadow: 0 10px 15px -3px rgba(0, 0, 0, 0.1);
        }

        .progress-bar {
            height: 8px;
            border-radius: 4px;
        }
    </style>

</head>
<body class="bg-gray-50 text-gray-800">

  <!-- النافبار -->
  <nav class="bg-primary text-white p-4 shadow-lg">
    <div class="container mx-auto flex flex-col md:flex-row justify-between items-center">
      <div class="flex items-center mb-4 md:mb-0">
        <h1 class="text-xl md:text-2xl font-bold">pharammcy app </h1>
      </div>

      <div class="flex flex-wrap justify-center gap-4 md:gap-6">
       <a href="{{route('go')}}" class="hover:underline">Main</a>
<div class="relative group inline-block">

    <a href="#" class="hover:underline">Users</a>

    <div class="absolute hidden group-hover:block bg-black shadow-md rounded mt-2">
        <a href="{{ route('admin.listuser') }}" class="block px-4 py-2 ">Show All Users</a>
        <a href="{{ route('admin.createuser') }}" class="block px-4 py-2 ">Add User</a>
    </div>
</div>
<div class="relative group inline-block">

    <a href="#" class="hover:underline">Supplier</a>

    <div class="absolute hidden group-hover:block bg-black shadow-md rounded mt-2">
          <a href="{{ route('supplier.listsupplier') }}" class="block px-4 py-2 ">Show All Supplier</a>
          <a href="{{ route('supplier.createsupplier') }}" class="block px-4 py-2 ">Add Supplier</a>


       </div>
</div>

          <form method="POST" action="{{ route('logout') }}">
        @csrf
        <button type="submit"
                class="bg-red-300 hover:bg-red-400 px-4 py-2 rounded-lg text-white font-semibold transition">
          <i class="fas fa-sign-out-alt"></i> تسجيل خروج
        </button>
      </form>
      </div>
      </div>

      <div class="mt-4 md:mt-0 flex items-center">

      {{ Auth::user()->name }}

      </div>
    </div>
  </nav>


  <!-- محتوى الصفحة -->
  <main class="container mx-auto px-4 py-8 animate-fade-in">
    @yield('content')
  </main>

  <!-- فوتر -->
  <footer class="text-center py-6 text-sm text-gray-500 border-t border-gray-200 animate-fade-in">
    <p>&copy; {{ now()->year }} - Developed By Zyad Ayman💎</p>
  </footer>
@stack('scripts')

</body>
</html>


