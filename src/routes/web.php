<?php

use Illuminate\Support\Facades\Route;
use Livewire\Volt\Volt;

Volt::route("/", "counter");

require __DIR__ . '/auth.php';
