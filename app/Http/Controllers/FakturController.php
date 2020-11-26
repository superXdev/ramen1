<?php

namespace App\Http\Controllers;

use App\Models\Faktur;
use App\Models\Goods;
use App\Models\Outlet;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Response;

class FakturController extends Controller
{
    public function index()
    {
        $selectOutlet = Outlet::pluck('namaOutlet', 'id');
        return view('faktur.fakturDex', ['outlet' => $selectOutlet,]);
    }

    public function getOutlet($id)
    {
        $all = new Outlet();

        $outlet = $all->where('id', $id)->get();

        return response()->json($outlet);
    }

    public function getJenis($jenis)
    {
        $goodsPrice = DB::table('goods_prices')->where('jenisOutlet', '=', $jenis)->get();
        
        return response()->json($goodsPrice);
    }

    public function getGoods($goodsId)
    {
        $goods = DB::table('goods')->where('id', '=', $goodsId)->get();
        
        return response()->json($goods);
    }

    public function create(Request $request)
    {
         
      return view('faktur.fakturDex');
    }

    
    public function store(Request $request){ 
        
$mahasiswa = json_decode($request->json()->all());

return $mahasiswa;



     }

     public function test(Request $request) {
     }
}
