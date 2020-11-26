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
        $kodeFaktur = $request->data['head'][0]['kodeFaktur'];
        $outletId = $request->data['head'][0]['outlet'];

        // insert fakturs
        DB::table('fakturs')->insert([
            'slug' => 'tes', // set slugnya sendiri ya
            'namaPengirim' => auth()->user()->name,
            'invoice' => $kodeFaktur,
            'outlet_id' => $outletId
        ]);

        // iteration goods detail
        foreach($request->data['detailData'] as $data){
            // insert faktur barang
            DB::table('faktur_barangs')->insert([
                'faktur_id' => $kodeFaktur, // lebih baik ganti jadi id fakturs bukan kode
                'barang_id' => $data['idBarang'],
                'qty' => $data['qty'],
                'jumlah_harga' => $data['harga']
            ]);
        }
        
        // $mahasiswa = json_decode($request->json()->all());
        // Catatan tambahan: gunakan eloquent model pada proses CRUD database
        // untuk hasil terbaik dan memudahkan dalam proses maintain

        return 'ok';

     }

     public function test(Request $request) {
     }
}
