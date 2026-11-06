import { defineConfig, loadEnv } from 'vite'
import react from '@vitejs/plugin-react'

// The browser cannot POST cross-origin to IRIS without CORS, so the dev server
// proxies /iris/* to the IRIS web server (override with IRIS_TARGET).
export default defineConfig(({ mode }) => {
  const env = loadEnv(mode, process.cwd(), '')
  const target = env.IRIS_TARGET || 'http://localhost:28000'
  return {
    plugins: [react()],
    server: {
      port: 5173,
      proxy: {
        '/iris': { target, changeOrigin: true, rewrite: (p) => p.replace(/^\/iris/, '') },
      },
    },
  }
})
