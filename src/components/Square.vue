<template lang="html">
  <div class="square" @drop="drop" @dragover="allowDrop">
    <img :src="square.imageURL" alt="tile" v-if="square" :style="rotation">
  </div>

</template>

<script>
import {eventBus} from '@/main.js'

export default {
  name: 'Square',
  props: ['index', 'boardState'],
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
    checkTop: function(side){
      if (this.index <= 10){
        return true
      }
      if (this.boardState[this.index-11] === ""){
        return true
      } else {
        return side === this.boardState[this.index-11].sides[2];
      }
    },
    checkRight: function(side){
      if ([10,21,32,43,54,65,76,87,98,109,120].includes(this.index)){
        return true;
      }
      if (this.boardState[this.index+1] === ""){
        return true
      } else {
        return side === this.boardState[this.index+1].sides[3];
      }
    },
    checkBottom: function(side){
      if (this.index >= 110){return true};
      if (this.boardState[this.index+11] === ""){
        return true
      } else {
        return side === this.boardState[this.index+11].sides[0];
      }
    },
    checkLeft: function(side){
      if ([0,11,22,33,44,55,66,77,88,99,110].includes(this.index)){
        return true;
      }
      if (this.boardState[this.index-1] === ""){
        return true
      } else {
        return side === this.boardState[this.index-1].sides[1];
      }
    },
    dropIsAllowed: function(tile){
      return this.checkTop(tile.sides[0]) &&
      this.checkRight(tile.sides[1]) &&
      this.checkBottom(tile.sides[2]) &&
      this.checkLeft(tile.sides[3])
    },
    drop: function(ev) {
      ev.preventDefault();
      const parsedPayload = JSON.parse(ev.dataTransfer.getData("text"));
      if (this.dropIsAllowed(parsedPayload.tile)){
        this.square = parsedPayload.tile;
        this.rotation = `transform:rotate(${parsedPayload.rotation}deg)`;
        const payload = {"tile": this.square, "index": this.index}
        eventBus.$emit('tile-dropped', payload)
      }
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
