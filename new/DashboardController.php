// app/Http/Controllers/DashboardController.php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\CybersecurityData;

class DashboardController extends Controller
{
    public function index()
    {
        $data = CybersecurityData::latest()->take(100)->get(); // Fetch the last 100 data records

        return view('dashboard.index', compact('data')); // Pass data to the view
    }

    public function fetchRealTimeData()
    {
        $data = CybersecurityData::latest()->take(50)->get(); // Fetch latest data
        return response()->json($data);
    }
}

