'use client'

import Modal from './Modal'
import { Landmark } from '@/lib/supabase/types'

interface SyncConfirmationModalProps {
  isOpen: boolean
  onClose: () => void
  onOverwrite: () => void
  onKeepChanges: () => void
  editedLandmarks: Landmark[]
}

export default function SyncConfirmationModal({
  isOpen,
  onClose,
  onOverwrite,
  onKeepChanges,
  editedLandmarks,
}: SyncConfirmationModalProps) {
  return (
    <Modal isOpen={isOpen} onClose={onClose} title="Sync Conflict" maxWidth="lg">
      <div className="space-y-4">
        <div className="flex items-start gap-3 p-4 bg-red-50 rounded-lg">
          <div className="shrink-0 mt-0.5">
            <svg className="w-5 h-5 text-red-800" fill="none" stroke="currentColor" viewBox="0 0 24 24">
              <path
                strokeLinecap="round"
                strokeLinejoin="round"
                strokeWidth={1.5}
                d="M12 9v3.75m-9.303 3.376c-.866 1.5.217 3.374 1.948 3.374h14.71c1.73 0 2.813-1.874 1.948-3.374L13.949 3.378c-.866-1.5-3.032-1.5-3.898 0L2.697 16.126zM12 15.75h.007v.008H12v-.008z"
              />
            </svg>
          </div>
          <div>
            <p className="text-sm text-red-800">
              Syncing will overwrite these changes with data from the Zurich Tourism API. What would you like to do?
            </p>
          </div>
        </div>

        <div className="flex flex-col-reverse sm:flex-row justify-end gap-2 sm:gap-3 pt-4 border-t border-gray-100">
          <button
            type="button"
            onClick={onKeepChanges}
            className="px-4 py-2.5 text-sm font-medium text-gray-700 hover:text-gray-900 hover:bg-gray-100 rounded-lg transition-colors"
          >
            Keep My Changes
          </button>
          <button
            type="button"
            onClick={onOverwrite}
            className="px-4 py-2.5 text-sm font-medium text-white bg-linear-to-r from-blue-500 to-cyan-400 hover:from-blue-600 hover:to-cyan-500 rounded-lg transition-colors shadow-sm"
          >
            Overwrite All
          </button>
        </div>
      </div>
    </Modal>
  )
}