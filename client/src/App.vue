<template lang="html">
  <div class="main">
    <h1> CarcaCodeClan </h1>
    <board :boardState="boardState"/>
    <next-tile-area :tiles="tiles"/>
    <scoreboard/>
  </div>
</template>

<script>
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
  }
}
</script>

<style lang="css" scoped>

</style>
