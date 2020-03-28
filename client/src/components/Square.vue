<template lang="html">
  <div class="square" @drop="drop" @dragover="allowDrop">
    <img :src="square.imageURL" alt="tile" v-if="square" :style="rotation">
  </div>

</template>

<script>
import {eventBus} from '@/main.js'

export default {
  name: 'Square',
  props: ['index'],
  data() {
    return {
      square: null,
      rotation: ""
    }
  },
  methods: {
    allowDrop: function(ev){
      ev.preventDefault();
    },
    drop: function(ev) {
      ev.preventDefault();
      const parsedPayload = JSON.parse(ev.dataTransfer.getData("text"));
      this.square = parsedPayload.tile;
      console.log(parsedPayload);

      this.rotation = `transform:rotate(${parsedPayload.rotation}deg)`;

      const payload = {"tile": this.square, "index": this.index}
      eventBus.$emit('tile-dropped', payload)

    }
  }
}
</script>

<style lang="css" scoped>
.square {
  border: 1px solid black;
  transition: transform .2s;
  background-color: #826848;
}

.square:hover {
  transform: scale(1.5);
  z-index: 1;
}

img {
  max-width: 70px;
  max-height: 70px;
  position: absolute;
}
</style>
