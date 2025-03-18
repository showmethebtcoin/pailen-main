
import { useContext } from 'react';
import { AuthContext } from '@/context/AuthContext';

// Custom hook to use the auth context
export const useAuth = () => useContext(AuthContext);
