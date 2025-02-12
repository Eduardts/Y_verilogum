// app/Http/Controllers/DataPrivacyController.php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\SensitiveData;

class DataPrivacyController extends Controller
{
    public function index()
    {
        $data = SensitiveData::all(); // Retrieve all sensitive data records
        return view('privacy.index', compact('data'));
    }

    public function anonymize(Request $request)
    {
        // Anonymization logic based on request input
        $record = SensitiveData::find($request->input('id'));
        $record->sensitive_field = "ANONYMIZED"; // Simple anonymization
        $record->save();

        return redirect()->back()->with('message', 'Data anonymized successfully.');
    }
}

