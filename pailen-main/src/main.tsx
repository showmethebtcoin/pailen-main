
import { createRoot } from 'react-dom/client'
import App from './App.tsx'
import './index.css'
import './i18n.ts'; // Importar la configuración de i18n

createRoot(document.getElementById("root")!).render(<App />);
