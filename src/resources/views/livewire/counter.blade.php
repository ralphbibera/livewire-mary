<?php

use Livewire\Volt\Component;

new class extends Component {
    public $count = 0;

    public function increment()
    {
        $this->count++;
    }

    public function decrement()
    {
        $this->count--;
    }
} ?>

<div class="flex justify-center items-center">
    <x-card title="Simple Counter" class="border">
        <div class="flex items-center gap-2">
            <x-button wire:click="increment" class="btn-primary">+</x-button>
            <h1>{{ $count }}</h1>
            <x-button wire:click="decrement" class="btn-secondary">-</x-button>
        </div>
    </x-card>
</div>