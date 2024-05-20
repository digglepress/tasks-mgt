import React from "react";

const Footer = () => {
  return (
    <div>
      <footer>
        <div className="w-full mx-auto max-w-screen-xl p-4 md:flex md:items-center md:justify-between">
          <span className="flex text-sm text-gray-500 sm:text-center">
            © 2024 <li className="hover:underline">tasks-mgt</li>. All Rights
            Reserved.
          </span>
        </div>
      </footer>
    </div>
  );
};

export default Footer;
