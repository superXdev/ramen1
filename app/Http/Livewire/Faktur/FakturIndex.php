<?php

namespace App\Http\Livewire\Faktur;

use App\Models\Outlet;
use Livewire\Component;

class FakturIndex extends Component
{
    
    public function render()
    {
        $selectOutlet = Outlet::all();
        return view('livewire..faktur.faktur-index', ['outlet' => $selectOutlet,]);
    }
    


}
