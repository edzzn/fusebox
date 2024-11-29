import { sveltekit } from '@sveltejs/kit/vite';
import autoprefixer from 'autoprefixer';
import tailwindcss from 'tailwindcss';
import { defineConfig } from 'vite';


import { loadEnv } from 'vite';

export default ({ mode }: { mode: string }) => {
  process.env = { ...process.env, ...loadEnv(mode, process.cwd(), '') };
  
  return defineConfig({
    plugins: [sveltekit()],
    css: {
      postcss: {
        plugins: [tailwindcss(), autoprefixer()]
      }
    },  
    test: {
      include: ['src/**/*.{test,spec}.{js,ts}']
    }
//   });
// // };
// // export default defineConfig({
// //   plugins: [sveltekit()],
 
//   }
});
};