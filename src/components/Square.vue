<template lang="html">
  <div class="square" @drop="drop" @dragover="allowDrop">
    <img :src="square.imageURL" alt="tile" v-if="square" :style="rotation">
  </div>

</template>

<script>
import {eventBus} from '@/main.js'

export default {
  name: 'Square',
  props: ['index', 'boardState', 'boardIsEmpty'],
  data() {
    return {
      square: null,
      rotation: "",
    }
  },
  methods: {
    allowDrop: function(ev){
      ev.preventDefault();
    },
    checkTop: function(side){
      if (this.index <= this.rowLength-1){return true}
      if (this.boardState[this.index-this.rowLength] === ""){
        return true
      } else {
        return side === this.boardState[this.index-this.rowLength].sides[2];
      }
    },
    checkRight: function(side){
      if (((this.index+1) % this.rowLength) === 0) {return true}
      if (this.boardState[this.index+1] === ""){
        return true
      } else {
        return side === this.boardState[this.index+1].sides[3];
      }
    },
    checkBottom: function(side){
      if (this.index >= this.boardState.length-this.rowLength){return true};
      if (this.boardState[this.index+this.rowLength] === ""){
        return true
      } else {
        return side === this.boardState[this.index+this.rowLength].sides[0];
      }
    },
    checkLeft: function(side){
      if (this.index % this.rowLength === 0) {return true}
      if (this.boardState[this.index-1] === ""){
        return true
      } else {
        return side === this.boardState[this.index-1].sides[1];
      }
    },
    checkIsAttached: function(){
      return (this.boardState[this.index-this.rowLength] && this.boardState[this.index-this.rowLength] !== "") ||
          this.boardState[this.index-1] !== "" ||
          this.boardState[this.index+1] !== "" ||
          (this.boardState[this.index+this.rowLength] && this.boardState[this.index+this.rowLength] !== "")
    },
    dropIsAllowed: function(tile){
      return this.checkTop(tile.sides[0]) &&
      this.checkRight(tile.sides[1]) &&
      this.checkBottom(tile.sides[2]) &&
      this.checkLeft(tile.sides[3]) &&
      (this.checkIsAttached() || this.boardIsEmpty)
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
  },
  computed: {
    rowLength() { return Math.sqrt(this.boardState.length) }
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
  width: 9vh;
  height: 9vh;
  position: absolute;
}
</style>
