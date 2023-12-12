<?php

namespace App\Http\Controllers\Backend;

use App\Http\Controllers\Controller;
use App\Models\Pendidikan;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Response;

class ApiPendidikanController extends Controller
{
    public function getAll()
    {
        $pendidikan = Pendidikan::all();
        return Response::json($pendidikan, 200);
    }

    public function createPen(Request $request)
    {
        Pendidikan::create($request->all());
        return Response::json([
            'status' => 'ok',
            'message' => 'Data has been created'
        ], 201);
    }

    public function getPen($id)
    {
        $pendidikan = Pendidikan::find($id);
        return Response::json($pendidikan, 200);
    }

    public function updatePen($id, Request $request)
    {
        Pendidikan::find($id)->update($request->all());
        return Response::json([
            'status' => 'ok',
            'message' => 'Data has been updated'
        ], 201);
    }

    public function deletePen($id)
    {
        Pendidikan::destroy($id);
        return Response::json([
            'status' => 'ok',
            'message' => 'Data has been deleted'
        ], 201);
    }
}
