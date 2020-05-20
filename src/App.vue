<template lang="html">
  <div class="main">
    <div class="board-div">
      <board :boardState="boardState"/>
    </div>
    <div class="right-half">
      <p class="page-title"> CarcaCodeClan </p>
      <next-tile-area :tiles="tiles"/>
      <scoreboard class="scoreboard"/>
    </div>
  </div>
</template>

<script>
import {eventBus} from '@/main.js'
import Board from './components/Board.vue'
import NextTileArea from './components/NextTileArea.vue'
import Scoreboard from './components/Scoreboard.vue'
import Tile from './components/Tile.vue'

export default {
  name: "app",
  data(){
    return {
      boardState: Array(121).fill(""),
      tiles: []
    }
  },
  components: {
    'board': Board,
    'next-tile-area': NextTileArea,
    'scoreboard': Scoreboard,
    'tile': Tile
  },
  methods: {
    shuffle: function (a) {
    let startTile = a.splice(46,1)
    for (let i = a.length - 1; i > 0; i--) {
        const j = Math.floor(Math.random() * (i + 1));
        [a[i], a[j]] = [a[j], a[i]];
    }
    a.unshift(startTile[0])
    return a;
  }
},
  mounted(){
    fetch('https://carcacodeclan-tile-api.herokuapp.com/api/v1/tiles')
      .then(res => res.json())
      .then(data => this.tiles = this.shuffle(data))

    eventBus.$on('tile-reset', payload => {
      this.boardState[payload.index] = payload.tile;
      this.tiles.shift();
    })
  }
}
</script>

<style lang="css" scoped>
.main {
  width: 100%;
  display: flex;
  font-family: Luminari;
}

.board {
  width: 50%
}

.right-half {
  width: 45vw;
  height: 99vh;
  margin: 0.5vh 0.5vw;
  border: 1px solid black;
  padding: 1vh;
  text-align: center;
}

.page-title {
  font-size: 6vh;
}

</style>
